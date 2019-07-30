function getService(serviceName) {
    return angular.element(document.body).injector().get(serviceName);
}

console.log("Usage: var sfService = getService('sfService')");
