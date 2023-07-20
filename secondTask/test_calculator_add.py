"""
Module: test_calculator_add

Contains test cases for the addition operation in the Calculator class.
"""

import pytest
from calculator import Calculator


class TestCalculator:
    """
    TestCalculator class for testing the Calculator class's addition operation.
    """

    def setup_method(self):
        """
        Setup method to create a Calculator instance before each test method.
        """
        self.calculator = Calculator()

    def test_add_positive_numbers(self):
        """Test addition of positive numbers."""
        result = self.calculator.add(4, 3)
        assert result == 7

    def test_add_negative_numbers(self):
        """Test addition of negative numbers."""
        result = self.calculator.add(-5, -6)
        assert result == -11

    def test_add_positive_and_negative_numbers(self):
        """Test addition of positive and negative numbers."""
        result = self.calculator.add(4, -1)
        assert result == 3

    def test_add_zero_to_zero(self):
        """Test addition of zero to zero."""
        result = self.calculator.add(0, 0)
        assert result == 0

    def test_add_zero_to_number(self):
        """Test addition of zero to a number."""
        result = self.calculator.add(0, 9)
        assert result == 9

    def test_add_double_numbers(self):
        """Test addition of floating-point numbers."""
        result = self.calculator.add(2.3, 2.47)
        assert result == pytest.approx(4.77, abs=1e-2)

    def test_add_big_numbers(self):
        """Test addition of big numbers."""
        result = self.calculator.add(1000000000000002, 999999999999999)
        assert result == 2000000000000001

    def test_add_big_negative_numbers(self):
        """Test addition of big negative numbers."""
        result = self.calculator.add(-3000000000000002, 999999999999999)
        assert result == -2000000000000003

    def test_add_invalid_input(self):
        """Test addition with invalid input."""
        with pytest.raises(TypeError):
            self.calculator.add("3", 7)
