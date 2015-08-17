json.array!(@blood_tests) do |blood_test|
  json.extract! blood_test, :id, :bgl, :mass, :comment
  json.url blood_test_url(blood_test, format: :json)
end
