from playwright.sync_api import sync_playwright


def main():
    with sync_playwright() as p:
        for navigator in [p.chromium, p.firefox]:
            browser = navigator.launch(headless=False)
            page = browser.new_page()
            page.goto("http://playwright.dev")
            print(f"{navigator.name} >>> {page.title()}")
            browser.close()


if __name__ == '__main__':
    main()