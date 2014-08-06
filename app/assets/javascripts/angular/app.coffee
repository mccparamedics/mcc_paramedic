angular.module('app', [
  'ngRoute',
  'templates'

  ,'drugCalculations'
  ,'directives.drugCalculation'
])
$(document).on('ready page:load', ->
  angular.bootstrap('body', ['app'])
)

#angular.module('app').config(['$routeProvider', '$locationProvider', '$httpProvider', ($routeProvider, $locationProvider, $httpProvider) ->
#  $locationProvider.html5Mode(true)
#  $routeProvider.when('/drug_calculations/index', {controller: 'DrugCalculationCtrl'})
#])
#    { templateUrl: '<%= asset_path('contacts/index.html') %> ',
#      controller: "ContactsIndexCtrl" })

#  'ngAnimate',
#  'ngRoute',
#  'routes',
#  'accounts',
#  'confirmations',
#  'courses',
#  'messageTemplates',
#  'organizations',
#  'passwords',
#  'promotions',
#  'registrations',
#  'attendeeMessages',
#  'scheduledMessages',
#  'sessions',
#  'settings',
#  'static_pages',
#  'students',
#  'studentImports',
#  'support',
#  'users',
#
#  'admin.routes',
#  'admin.admin',
#  'admin.courseTemplates',
#  'admin.courseTemplateFields',
#  'admin.dripCampaignTemplates',
#  'admin.dripCampaignEmails',
#  'admin.studentFields',
#  'admin.organizations',
#  'admin.studentImports',
#  'courseTemplates',
#  'courseTemplateFields',
#  'admin.plans',
#  'studentFields',
#
#  # filters
#  'filters.address',
#  'filters.contactDetail',
#  'filters.dateRange',
#  'filters.ifEmpty',
#  'filters.phone',
#  'filters.range',
#  'filters.sortable',
#  'filters.time',
#  'filters.studentFieldValue',
#  'filters.filterNot',
#
#  #  services
#  'passwordReset',
#  'services.breadcrumbs',
#  'services.i18nNotifications',
#  'services.httpRequestTracker',
#  'services.sockets',
#  'services.sharedService',
#  'security',
#  'subscription',
#  'responseFormatter',
#
#  #  directives
#  'directives.addresses',
#  'directives.addressField',
#  'directives.autocomplete',
#  'directives.autosave',
#  'directives.autowidth',
#  'directives.checkList',
#  'directives.contactDetailField',
#  'directives.contactDetails',
#  'directives.contentPopover',
#  'directives.coursesList',
#  'directives.currency',
#  'directives.customField',
#  'directives.creditCard',
#  'directives.crud',
#  'directives.datepicker',
#  'directives.datetimepicker',
#  'directives.dateRangePicker',
#  'directives.editable',
#  'directives.field_types',
#  'directives.formField',
#  'directives.loading',
#  #  'directives.modelExpression',
#  'directives.navbar',
#  'directives.ngConfirmClick',
#  'directives.paginate',
#  'directives.phone',
#  'directives.progressbar',
#  'directives.required',
#  'directives.sortable',
#  'directives.studentsFilter',
#  'directives.switch',
#  'directives.tabs',
#  'directives.textLength',
#  'directives.timepicker',
#  'directives.uniqueEmail',
#  'ui.bootstrap.popover',
#
#  'uiSlider',
#
#  # HTML templates
#  'templates',
#
#  'resources.states'#,
#  #  'interceptors'
#, 'pageLoader'
#
#  #  , 'facebook'
#
#, 'ngSanitize'
#])
#
##//TODO: move those messages to a separate module
#angular.module('app').constant('I18N.MESSAGES', {
#  'errors.route.changeError':'Route change error',
#  'errors.route.forbidden':'You are not authorized to access that page',
#  'crud.user.save.success':"A user with id '{{id}}' was saved successfully.",
#  'crud.user.remove.success':"A user with id '{{id}}' was removed successfully.",
#  'crud.user.remove.error':"Something went wrong when removing user with id '{{id}}'.",
#  'crud.user.save.error':"Something went wrong when saving a user...",
#  'crud.project.save.success':"A project with id '{{id}}' was saved successfully.",
#  'crud.project.remove.success':"A project with id '{{id}}' was removed successfully.",
#  'crud.project.save.error':"Something went wrong when saving a project...",
#  'login.reason.notAuthorized':"You do not have the necessary access permissions.  Do you want to login as someone else?",
#  'login.reason.notAuthenticated':"You must be logged in to access this part of the application.",
#  'login.error.invalidCredentials': "Login failed.  Please check your credentials and try again.",
#  'login.error.serverError': "There was a problem with authenticating with the server.  If this persists, please email support@coursepr.com.",
#  'login.success': "Successfully logged in!"
#})
#
##angular.module('app').config(['FacebookProvider', (FacebookProvider) ->
##  FacebookProvider.init(window.CoursePR.FacebookAppId)
##])
#
#angular.module('app').config(['$routeProvider', '$locationProvider', '$httpProvider', ($routeProvider, $locationProvider, $httpProvider) ->
#  $locationProvider.html5Mode(true)
#  $httpProvider.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest"
#])
#
#angular.module('app').run(['$rootScope', 'security', 'subscription', 'passwordReset', '$cookies', 'i18nNotifications', 'State', ($rootScope, security, subscription, passwordReset, $cookies, notifications, State) ->
#  # Get the current user when the application starts
#  # (in case they are still logged in from a previous session)
#  State.index()
#
#  security.requestCurrentUser()
#  if $cookies.flash_messages
#    messages = JSON.parse($cookies.flash_messages)
#    angular.forEach messages, (message, key) ->
#      if _.find(['alert', 'error', 'message', 'notice', 'warning'], (name) -> name == key)
#        notifications.pushForNextRoute message.replace(/\+/g, ' '), key
#      delete messages[key]
#    $cookies.flash_messages = JSON.stringify messages
#])
#
#angular.module('app').controller('AppCtrl', ['$rootScope', '$scope', '$window', '$location', 'i18nNotifications', 'localizedMessages', '$http', 'breadcrumbs', 'pageLoader', 'security', ($rootScope, $scope, $window, $location, notifications, localizedMessages, $http, breadcrumbs, pageLoader, security) ->
#  $http.defaults.headers.common['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content')
#  $scope.notifications = notifications
#
#  $scope.removeNotification = (notification) ->
#    notifications.remove(notification)
#
#  $scope.$on '$routeChangeStart', (next, current) ->
#    pageLoader.open('routeChangeStart')
#    security.checkExpiry()
#    $('.datepicker').remove()
#    $('.bootstrap-timepicker').remove()
#    $('.daterangepicker').remove()
#    $('.content-popover').remove()
#
#  parts = window.location.hostname.split('.').splice(-3, 3)
#  if parts.length == 3 and parts[0] != 'staging'
#    parts.shift()
#  $rootScope.domain = parts.join('.')
#
#  routeChangeNotifications = []
#  $scope.$on '$routeChangeError', (event, current, previous, rejection) ->
#    pageLoader.close('routeChangeError')
#    for routeChangeNotification in routeChangeNotifications
#      notifications.remove routeChangeNotification
#    unless security.loginCanceled()
#      if window.routeChanged
#        $window.history.back()
#      else
#        $location.path '/'
#    if rejection
#      if rejection.status == 403
#        routeChangeNotifications.push notifications.pushForNextRoute('errors.route.forbidden', 'error', {}, {rejection: rejection})
#      if rejection.status == 404
#        routeChangeNotifications.push notifications.pushForCurrentRoute('Page not found', 'error', {}, {rejection: rejection})
#    else
#      routeChangeNotifications.push notifications.pushForNextRoute('errors.route.changeError', 'error', {}, {rejection: rejection})
#
#  $scope.$on '$routeChangeSuccess', (angularEvent, current, previous) ->
#    pageLoader.close('routeChangeSuccess')
#    window.routeChanged = true
#
#  $scope.location = $location
#  $scope.breadcrumbs = breadcrumbs
#
#  $scope.$watch (->
#    security.currentUser
#  ), (currentUser) ->
#    $scope.currentUser = currentUser
#
#  $scope.getCurrentTenant = () ->
#    $http.get('/api/organizations/current').then (result) ->
#      console.log result
#  $scope.getCurrentUser = () ->
#    $http.get('/api/users/current').then (result) ->
#      console.log result
#
#  $scope.triggerSubscriptionPlan = () ->
#    $http.get('/development/interceptors/subscription_plan.json')
#  $scope.triggerMarketingCredits = () ->
#    $http.get('/development/interceptors/marketing_credits.json')
#  $scope.triggerPasswordReset = () ->
#    $http.get('/development/interceptors/password_reset.json')
#  $scope.triggerUnauthorized = () ->
#    $http.get('/development/interceptors/unauthorized.json')
#  $scope.triggerInvalidAuthenticityToken = () ->
#    $http.get('/development/interceptors/authenticity_token.json')
#  $scope.triggerAlreadySignedIn = () ->
#    $http.get('/development/interceptors/signed_in.json')
#
#])
#
#angular.module('app').controller('HeaderCtrl', ['$scope', '$route', "$http", "$location", 'httpRequestTracker', 'notifications', ($scope, $route, $http, $location, httpRequestTracker, notifications) ->
#  $scope.isNavbarActive = (navBarPath) ->
#    navBarPath == breadcrumbs.getFirst().name
#
#  $scope.hasPendingRequests = httpRequestTracker.hasPendingRequests
#])
#
#angular.module('app').controller('FooterCtrl', ['$scope', ($scope) ->
#])
