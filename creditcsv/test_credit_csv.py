import unittest
import credit_csv
import subprocess

class TestCreditCsv(unittest.TestCase):

    # .venv/bin/python3 credit_csv.py
    # ファイル指定がないときのエラー
    def test_command_error(self):
        # cmd = subprocess.run([".venv/bin/python3", "credit_csv.py"], capture_output=True, text=True)
        cmd = subprocess.run(["git"], capture_output=True, text=True)
        print(cmd)
        container = cmd.stderr
        member = "error"
        self.assertNotEqual(cmd.returncode, 0)
        self.assertIn(member, container)

    # .venv/bin/python3 credit_csv.py -h
    # ヘルプの確認
    def test_command_help(self):
        cmd = subprocess.run([".venv/bin/python3", "credit_csv.py", "--help"], capture_output=True, text=True)
        container = cmd.stdout
        member = "positional arguments:"
        self.assertEqual(cmd.returncode, 0)
        self.assertIn(member, container)

if __name__ == '__main__':
    unittest.main()
