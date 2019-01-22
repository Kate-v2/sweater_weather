

class WelcomeFacade

  def display_endpoints
    endpoints.values
  end


  def endpoints
    {
      forecasts:        'GET /api/v1/forecasts?location=denver,co',
      forecasts_gifs:   'GET /api/v1/gifs?location=denver,co',
      new_user:        'POST /api/v1/users',
      login:           'POST /api/v1/sessions',
      new_favorite:    'POST /api/v1/favorites',
      user_favorites:  'GET /api/v1/favorites',
      delete_favorite: 'DELETE /api/v1/favorites'
    }
  end

  def describe_forecast
    "
      <h3 class='section'>
        To receive forecast information for a location:
      </h3>
      <p class='endpoint'>#{endpoints[:forecasts]}</p>
      <p class='msg'>
        Content-Type: application/json <br>
        Accept: application/json <br>
      </p>
    ".html_safe
  end

  def describe_forecast_gifs
    "
      <h3 class='section'>
        To receive gifs associated with forecast information for a location:
      </h3>
      <p class='endpoint'>#{endpoints[:forecasts_gifs]}</p>
      <p class='msg'>
        Content-Type: application/json <br>
        Accept: application/json <br>
      </p>
    ".html_safe
  end

  def describe_new_user
    "
      <h3 class='section'>
        To create a new user:
      </h3>
      <p class='endpoint'>#{endpoints[:new_user]}</p>
      <p class='msg'>
        Content-Type: application/json <br>
        Accept: application/json <br>
        Body: <br>
        { <br>
        <Pre>  'email': 'whatever@example.com', </Pre>
        <Pre>  'password': 'password', </Pre>
        <Pre>  'password_confirmation': 'password' </Pre>
        }
      </p>
    ".html_safe
   end

  def describe_login
    "
      <h3 class='section'>
        To login a user:
      </h3>
      <p class='endpoint'>#{endpoints[:login]}</p>
      <p class='msg'>
        Content-Type: application/json <br>
        Accept: application/json <br>
        Body: <br>
        { <br>
        <Pre>  'email': 'whatever@example.com', </Pre>
        <Pre>  'password': 'password', </Pre>
        }
      </p>
    ".html_safe
   end

  def describe_new_favorite
    "
      <h3 class='section'>
        To add a user favorite:
      </h3>
      <p class='endpoint'>#{endpoints[:new_favorite]}</p>
      <p class='msg'>
        Content-Type: application/json <br>
        Accept: application/json <br>
        Body: <br>
        { <br>
        <Pre>  'location': 'Denver, CO', </Pre>
        <Pre>  'api_key': 'jgn983hy48thw9begh98h4539h4', </Pre>
        }
      </p>
    ".html_safe
   end

  def describe_favorites
    "
      <h3 class='section'>
        To see user favorites:
      </h3>
      <p class='endpoint'>#{endpoints[:user_favorites]}</p>
      <p class='msg'>
        Content-Type: application/json <br>
        Accept: application/json <br>
        Body: <br>
        { <br>
        <Pre>  'api_key': 'jgn983hy48thw9begh98h4539h4', </Pre>
        }
      </p>
    ".html_safe
   end

  def describe_delete_favorite
    "
      <h3 class='section'>
        To delete a user favorite:
      </h3>
      <p class='endpoint'>#{endpoints[:delete_favorite]}</p>
      <p class='msg'>
        Content-Type: application/json <br>
        Accept: application/json <br>
        Body: <br>
        { <br>
          <Pre>  'location': 'Denver, CO', </Pre>
          <Pre>  'api_key': 'jgn983hy48thw9begh98h4539h4', </Pre>
        }
      </p>
    ".html_safe
   end

end
