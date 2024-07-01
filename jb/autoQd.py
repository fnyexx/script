import requests
import sys
import traceback

login_url = "https://www.idcegg.com/login?action=phone"
target_url = 'https://www.idcegg.com/addons?_plugin=5&_controller=index&_action=index'
form_data1 = {"token": "e9256e28e7dcf3676b55973757a864ef",
              "phone": "13048977391",
              "password": "axs01141012"}


def run(form_data):
    s = requests.Session()
    response = s.post(login_url, data=form_data)
    #print(response.text)
    #print(response.status_code)
    if response.status_code == 200:
        resp = s.post(target_url, {'uid':2366})
        print(resp.text)


def main():
    run(form_data1)
    print("run1")


if __name__ == '__main__':
    try:
        sys.exit(main())
    except Exception as e:
        traceback.print_exc()
