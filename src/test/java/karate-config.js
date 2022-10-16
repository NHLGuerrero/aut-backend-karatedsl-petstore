function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'qa';
  }
  var config = {

    path_pet: '/pet/'
    
  }

  config.ambiente = karate.call('classpath:core/environment/config-' + env + '.js');

  return config;
}