local ok, _ = pcall(require, "impatient")
if not ok then
  print("Couldn't require impatient")
  return
end
