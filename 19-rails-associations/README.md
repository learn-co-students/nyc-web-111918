Rails Associations & Forms
==========================

## SWABATs

* Use Rails form helper methods that create an associated object
  * aka: `collection_select` in a `form_for`

## Outline

* Refresher on `has_many` and `belongs_to` in a one-to-many relationship.
* Add some seed data.
* CRUD it up! Build out the 7 RESTful routes.
* Learn about `collection_select` in a `form_for`.

YuGiOh Cards ==> MtG, Pokemon TCG, Vampire
* Deck >- Player

## Lecture Notes

### CRUD Review

The 7 RESTful Routes are:

1. index
2. show
3. new
4. create
5. edit
6. update
7. destroy

### Associations & Forms

DIY `collection_select`:

```html
<!-- DIY f.collection_select -->
  <select name="post[party_id]">
    <% Party.all.each do |party| %>
      <option value="<%= party.id %>">
        <%= party.theme %>
      </option>
    <% end %>
  </select>
```

How `collection_select` works in a `form_for`:

```html
<!--
  first arg is method we want to call on @kid (:party_id) THE KEY🔑 for my Params,
  the collection we want to use to populate the dropdown(Party.all || @parties which is a reference from the controller to be Party.all),
  the value we want in our params: Party#id,
  what do we want to display in the tag itself? Party#theme
-->
<!--   Kid >- Party   -->
<%= form_for @kid do |f| %>
  <!-- yada yada... -->
  <%= f.collection_select(:party_id, @parties, :id, :theme) %>
  <!-- yada yada... -->
  <%= f.submit %>
<% end %>
```
