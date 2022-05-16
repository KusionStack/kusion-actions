import os
import sys

if __name__ == "__main__":
    if len(sys.argv) > 1:
        diffs_str = sys.argv[1]
        diffs = diffs_str.split()
        result = set()
        for cp in diffs:
            cp = cp.strip("'")
            if not os.path.isdir(cp):
                cp = os.path.dirname(cp)
            p = os.path.join(cp, "stack.yaml")
            if os.path.exists(p):
                result.add(cp)
        print("\n".join(result))