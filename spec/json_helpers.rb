module JSONHelpers
  def sample_json_document
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

  def sample_json_array
    <<-EOS
    [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
    EOS
  end

  def sample_json_object
    <<-EOS
    {"value": "Close", "onclick": "CloseDoc()"}
    EOS
  end

end