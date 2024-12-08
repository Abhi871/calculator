# Calculator

This repository implements a **String Calculator** designed using **Test-Driven Development (TDD)** principles. The calculator supports various input formats and operations, adhering to requirements outlined in a TDD kata.

---

## Features

- Add numbers from a string of comma-separated or newline-separated numbers.
- Support for custom delimiters, including:
  - Single-character delimiters.
  - Multi-character delimiters (e.g., `[***]`).
  - Multiple delimiters (e.g., `[*][%]`).
- Ignores numbers greater than 1000.
- Throws an error for negative numbers and lists all negative values in the error message.
- Handles mixed delimiters and complex cases seamlessly.

---

## Getting Started

### Prerequisites

- **Ruby**: Ensure Ruby is installed on your system.
- **Rails**: This project uses Rails framework for testing purposes.
- **Bundler**: Install Bundler for dependency management.

```bash
gem install bundler
```

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Abhi871/calculator.git
   cd calculator
   ```

2. Install dependencies:

   ```bash
   bundle install
   ```

---

## Usage

To use the String Calculator, call the `StringCalculator.add` method with the input string:

```ruby
require './string_calculator'

puts StringCalculator.add("")             # Output: 0
puts StringCalculator.add("1,2,3")        # Output: 6
puts StringCalculator.add("//;\n1;2;3")   # Output: 6
puts StringCalculator.add("//[***]\n1***2***3") # Output: 6
puts StringCalculator.add("//[*][%]\n1*2%3")    # Output: 6
```

---

## Running Tests

This repository uses **RSpec** for testing.

### Run all tests:

```bash
rspec
```

### Example Test Output:

```bash
StringCalculator
  .add
    when the input string is empty
      returns 0
    when the input string contains one number
      returns the number itself
    ...
```

---

## File Structure

```plaintext
calculator/
├── app/
│   └── models/
│       └── string_calculator.rb    # Implementation of the String Calculator
├── spec/
│   ├── models/
│   │   └── string_calculator_spec.rb  # RSpec tests
│   └── spec_helper.rb            # RSpec configuration
└── README.md                     # Project documentation
```

---

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature/your-feature-name`.
3. Commit your changes: `git commit -m 'Add some feature'`.
4. Push to the branch: `git push origin feature/your-feature-name`.
5. Open a pull request.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contact

For questions or feedback, feel free to contact:

- **Abhi871** - [GitHub Profile](https://github.com/Abhi871)

Happy coding! 🚀

--- 