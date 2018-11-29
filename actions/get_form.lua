event: ["get_document_form"]
priority: 1
input_parameters: ["request"]

if request.forbidden then return end

local model_name = request.path_segments[1]
local model = models[model_name]

return {
  headers = {
    ["content-type"] = "text/html"
  },
  body = render("model_form.html", {
    SITENAME = torchbear.settings.sitename,
    TITLE = "New " .. model_name:capitalize(),
    model_name = model_name,
    model = model
  })
}
