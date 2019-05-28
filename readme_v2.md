# Todo list
~~DONE: // Setting up Rails 5.2 with PWA, Turbolinks, Webpack(er) 4, Babel 7, Vue.js 2.5 and Jest.~~

NEXT: user management role feature for example

## Setup scss and Bulma

* Prerequisites:

Let's install webpack before, let see how to setup at [@here](https://github.com/huongnhdh/rails-vue-kit/blob/master/readme_v1.md#upgrade-to-webpacker-4)

* Terminal:

```bash
yarn add bulma # install bulma
yarn add postcss-cssnext
```

* The structure of stylesheets folder

```bash
app/javascript/stylesheets
├── application.scss
├── _custom_bulma.scss
└── _variables.scss

```

see at [Bulma-custom style](https://bulma.io/documentation/customize/with-webpack/#9-add-your-own-bulma-styles)

* Edit file: `app/javascript/stylesheets/_custom_bulma.scss`

```sass
@charset "utf-8";

// Import a Google Font
@import url('https://fonts.googleapis.com/css?family=Nunito:400,700');

// Set your brand colors
$purple: #8A4D76;
$pink: #FA7C91;
$brown: #757763;
$beige-light: #D0D1CD;
$beige-lighter: #EFF0EB;

// Update Bulma's global variables
$family-sans-serif: "Nunito", sans-serif;
$grey-dark: $brown;
$grey-light: $beige-light;
$primary: $purple;
$link: $pink;
$widescreen-enabled: false;
$fullhd-enabled: false;

// Update some of Bulma's component variables
$body-background-color: $beige-lighter;
$control-border-width: 2px;
$input-border-color: transparent;
$input-shadow: none;

// Import only what you need from Bulma
@import "~bulma/bulma";
```

* Edit: `app/javascript/stylesheets/application.scss`

```sass
//application.scss
@import "variables";
@import "custom_bulma";
```

* Edit `app/javascript/packs/application.js`

```javascript
import '../stylesheets/application'
```

* Edit `config/webpack/loaders/sass.js`

```javascript
module.exports = {
  test: /\.scss$/,
  use: [
    {loader: 'css-loader'},
    {loader: 'postcss-loader', options: { sourceMap: true }}
  ]
}
```