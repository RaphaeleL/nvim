local ok, comment = pcall(require, "nvim_comment")
if not ok then
  print("Couldn't require nvim_comment")
  return
end

comment.setup()
