import re


def find_reference_code(text):
    result = re.search(r'Do not forget to insert your order reference (.*?) in the subject', text).group(1)
    return result


if __name__ == '__main__':
    r = find_reference_code("Do not forget to insert your order reference IDRRNTPHJ in the subject of your bank wire.")
    print(r)
