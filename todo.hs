import System.IO
import System.Environment
import Data.List
import System.IO.Error
import Task

fileName = "todo.txt"

main = do
  args <- getArgs
  action args

action :: [String] -> IO ()

action ("add":params) = do
  let task = unwords params
  appendFile fileName (task ++ "\n")
  putStrLn $ "Added: " ++ task

action ("rm":numStr:[]) = do
  contents <- readFile fileName
  let tasks = readTasks contents
  let num = read numStr :: Int
  let task = find (\t -> num == number t) tasks
  case task of
    Just task -> do
      length contents `seq` (removeTask num tasks)
      putStrLn $ "Removed: " ++ (description task)
    Nothing ->
      putStrLn $ "Cannot find task number " ++ (show num)
  `catch` (\e -> do
    if isDoesNotExistError e then
      putStrLn $ fileName ++ " not found."
    else
      putStrLn $ "Error: " ++ show e)

action [] = do
  contents <- readFile fileName
  let tasks = readTasks contents
  putStr $ showTasks tasks
  `catch` (\e -> do
    if isDoesNotExistError e then return ()
    else putStrLn $ "Error: " ++ show e)

action _ = do
  putStrLn "Usage: todo"
  putStrLn "Usage: todo add <a task>"
  putStrLn "Usage: todo rm <task number>"

removeTask :: Int -> [Task] -> IO ()
removeTask num tasks = 
  let remainingTasks = filter (\t -> num /= number t) tasks
  in writeFile fileName $ writeTasks remainingTasks