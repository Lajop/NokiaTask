import pytest
from calculator import Calculator


class TestCalculator:
    def setup_method(self):
        self.calculator = Calculator()

    def test_add_positive_numbers(self):
        result = self.calculator.add(4, 3)
        assert result == 7

    def test_add_negative_numbers(self):
        result = self.calculator.add(-5, -6)
        assert result == -11

    def test_add_positive_and_negative_numbers(self):
        result = self.calculator.add(4, -1)
        assert result == 3

    def test_add_zero_to_zero(self):
        result = self.calculator.add(0, 0)
        assert result == 0

    def test_add_zero_to_number(self):
        result = self.calculator.add(0, 9)
        assert result == 9

    def test_add_double_numbers(self):
        result = self.calculator.add(2.3, 2.47)
        assert result == 4.77

    def test_add_big_numbers(self):
        result = self.calculator.add(1000000000000002, 999999999999999)
        assert 2000000000000001

    def test_add_big_negative_numbers(self):
        result = self.calculator.add(-3000000000000002, 999999999999999)
        assert -2000000000000003

    def test_add_invalid_input(self):
        with pytest.raises(TypeError):
            self.calculator.add("3", 7)
