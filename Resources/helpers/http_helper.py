import requests


def get(url):
    try:
        r = requests.get(url)
        return str(r.status_code)
    except Exception:
        return Exception("Http Request Error")


if __name__ == '__main__':
    result = get("https://www.sinanerdinc.com/hepsiburada")
    print(result)
