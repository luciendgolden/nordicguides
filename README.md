# Nordic Guides Application

## Vuejs Frontend

`nordicguides-client`

## PHP Backend

`nordicguides-server`

## Requirements

### Public view requirements

All the users of the application can see the public site without login. In the pubic site
the following features are required:

- In the starting page there will be general information about pages, and
  Lapland. You can use as reference https://www.visitfinland.com/lapland/
- There is a link in navigation “Lapland”. There you can gather some information
  about Lapland. Make also a photogrip of photos of Lapland
- Guides page displays the listing of guides. When you click on a guide, you will
  see information card about the guide.
- Cities page displays the information about cities. You can see the guides
  connected to the city by clicking “Show guides”. When you click on the
  Country, you see the cities in that country only. From “Show guides” the
  listing of guides is displayed and you can click on guide to see the information
  card.
- In “About” page you will show the information about yourself with image of
  yourself

### Admin view requirements

Registered users can login to the adminsite by entering /admin/-folder through
webbrowser. Users can register themselves as Guides from login page. Here are the
features required for admin site

- Every user can access the “My profile” page where they can

      - Update their password
      - Update profile image
      - Update language skills
      - Update their connection to guide clubs
      - Update their profile information
      - Change their email address (remember to check, that email does not

  exist in database)

- Users with admin role can access the menu items “Members”, “Languages”
  and “Fees”

      - In languages admin can add and remove languages available

      - In members, admin sees the list of members – admins own name not

  in the list
  _ Admin can update the role of members in the list
  _ Admin can update password for members in the list \* Admin can update email for members in the list

      - In fees, admin sees the list of years with fees and

      	* Can update the fees in selected year
      	* Can see the list of member fees paid by members by clicking

  “Show payments” in each year
