from src.utils import fibonacci

def test_sequence_pass():
    expected = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
    result = fibonacci(10)
    assert result == expected
