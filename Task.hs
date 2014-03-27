module Task (
  Task,
  readTasks,
  showTasks,
  showTask,
  writeTasks,
  number,
  description
) where

data Task = Task {
  number :: Int,
  description :: String
}

readTasks :: String -> [Task]
readTasks s = map (\(n,s) -> Task n s) $ zip [1..] (lines s)

showTasks :: [Task] -> String
showTasks tasks = unlines $ map showTask tasks

showTask :: Task -> String
showTask task = 
  (show $ number task) ++ ". " ++ description task

writeTasks :: [Task] -> String
writeTasks tasks = 
  unlines $ map description tasks

