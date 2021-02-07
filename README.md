# exercises

This repository powers the exercise database for the goworkout app. Any contributions are welcome.

Exercises must have an `id`, `name` and `muscle_group`. `id` should be a valid UUID V4 and must be unique.

Please open a PR to add more exercises to the database

## Tests

Setup (requires ruby 3.0 installed)
```
bundle
```

Run test suite
```
bundle exec rspec
```

MIT License
