# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) -- User has_many Cocktails
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) -- Cocktail belongs_to User
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) --  Cocktail has_many Ingredients through CocktailIngredients and vice versa
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) -- Cocktail has_many Ingredients through CocktailIngredients and vice versa
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) -- CocktailIngredients has an amount attribute
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) -- many validations for presence and uniqueness
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - added a search bar on index view of cocktails to filter by ingredient name. shows up in url as /cocktails?search=Gin&commit=Search
- [x] Include signup (how e.g. Devise) - registrations controller and views
- [x] Include login (how e.g. Devise) - sessions controller and views
- [x] Include logout (how e.g. Devise) - sessions controller and views
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - OmniAuth and Twitter API
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - users/3/cocktails
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - comment form is in the show page view for the cocktail
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - using a partial called form_errors to render these to each form. 

Confirm:
- [x] The application is pretty DRY - used many partials and helper methods to accomplish
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate - title of index is changed depending on nested resources through format_title helper
- [x] Views use partials if appropriate - many partials for forms, navbars, etc..
