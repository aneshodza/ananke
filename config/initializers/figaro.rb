# frozen_string_literal: true

Figaro.require_keys(YAML.load_file('config/application.example.yml').keys - %w[test production development])
