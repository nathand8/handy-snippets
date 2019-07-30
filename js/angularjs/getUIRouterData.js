function getCurrentNavigation() {
    console.log('Current UI-Router State:', getService("$state").current)
}

getCurrentNavigation();
