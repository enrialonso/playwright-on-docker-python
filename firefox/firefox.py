from playwright.sync_api import sync_playwright


def main():
    with sync_playwright() as p:
        browser = p.firefox.launch(headless=False)
        page = browser.new_page()
        page.goto("http://playwright.dev")
        print(f"{p.firefox.name} >>> {page.title()}")
        browser.close()


if __name__ == '__main__':
    main()
