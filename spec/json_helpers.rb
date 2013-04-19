module JSONHelpers
  def sample_json_string
    <<-EOS
    {"menu": {
      "id": "file",
      "value": "File",
      "popup": {
        "menuitem": [
          {"value": "New", "onclick": "CreateNewDoc()"},
          {"value": "Open", "onclick": "OpenDoc()"},
          {"value": "Close", "onclick": "CloseDoc()"}
        ]
      }
    }}
    EOS
  end

  def sample_json_array_string
    <<-EOS
    [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
    EOS
  end

  def sample_json_object_string
    <<-EOS
    {"value": "Close", "onclick": "CloseDoc()"}
    EOS
  end

end