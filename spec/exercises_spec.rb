require 'spec_helper'
require 'pry'
require 'yaml'

describe 'exercises database' do
  MANDATORY_FIELDS = %w(id name muscle_group)

  it 'has valid yml files' do
    files = Dir["db/*.yml"]

    files.each_with_object({}) do |filepath, db|
      exercises = YAML.load(File.read(filepath))
      exercises.each do |exercise|
        expect(exercise.keys)
          .to include(*MANDATORY_FIELDS),
          "#{exercise} does not include all mandatory fields: #{MANDATORY_FIELDS.join(", ")}"

        id = exercise.fetch("id")
        expect(db).to_not have_key(id),
          "#{id} is not unique, previously seen at #{db[id]}"

        db[id] = exercise
      end
    end
  end
end
