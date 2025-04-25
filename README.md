# Personal Finance Tracker

This is a flutter project aimed at helping individuals manage their financial
operations.

The project is deployed, using firebase, in domain https://flutter-sample-1-29965.web.app

## Functional Requirements

First, the project includes accounting functionalities. These requirements
include register, login, and logout. After opening the application, if the
individual is not logged in, they will be redirected to the login page, located
in /account. At that page, if they have not created an account before, they will
be redirected to the registration page. After registration or logging in, the
individuals will be redirected to the dashboard page. Moreover, after logging
in, the individual always has the chance to logout on the top right of the
dashboard page.

Second, there are requirements related to categories. These include adding and
retrieving categories. The individual can access these requirements on the
"Category" tab of the dashboard.

Third, there are requirements related to incomes and spends. Each Income can
have a special date and an amount. They represent each income the individual
received. The spends are similar to income, but they represent the amount of
money the individual has spent. In addition, they have a certain category. The
individual can add and retrieve spends and incomes on the Wallet tab of the
dashboard.

Finally, there are requirements related to the statistics. These can be accessed
through the statistics tab of the dashboard. At the moment, the only requirement
in this tab, which you can access through the statistics tab, is seeing a bar
chart of total spent per category.

## UI Constraints

The dashboard is responsive. Each subpage on the dashboard has two width
breakpoints, mobile and tablet. mobile is any width below 500px and tablet is
any width bigger than 500px.

Moreover, there are forms if needed. The forms remember the states and forget
them as soon as the functionality is conducted.

Furthermore, there are four navigated screens. One of them, the screen
responsible for accounting, has a path variable.
