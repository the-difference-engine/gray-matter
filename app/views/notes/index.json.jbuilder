json.array!(@notes) do |note|
  json.extract! note, :id, :title, :note, :student_id
  json.url note_url(note, format: :json)
end
