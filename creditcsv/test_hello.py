import unittest
import hello
import subprocess

class TestHello(unittest.TestCase):

    def test_hello_string(self):
        self.assertEqual(hello.hello_string(), "hello_string")

    def test_hello_command(self):
        cmd = subprocess.run([".venv/bin/python3","hello.py"], encoding='utf-8', stdout=subprocess.PIPE)
        self.assertEqual(cmd.stdout, "hello_stdout\n")

if __name__ == '__main__':
    unittest.main()
