module Facebook
  CONFIG = YAML.load_file(Rails.root.join("config/facebook.yml"))[Rails.env]
  #APP_ID = CONFIG['app_id']
  #SECRET = CONFIG['secret_key']
  APP_ID = '1218085501541655'
  SECRET = '1140d25bdf5c9062d49d2c66a07cde76'
end
