
function alert_js(name, message){
    alert("Welcome " + name + ", the " + message);
}

function scale({lengthScale, widthScale, heightScale = 2}) {
    return 3 * lengthScale * 4 * widthScale * 5 * heightScale;
}

function callback_test(callback, content) {
    console.log("js: " + content);
    callback("this is a message from js");

    return {lengthScale: 1, widthScale: 1, heightScale: 2};
}

function say_hello(){
    console.log("hello, my name is Adam");
}

function say() {
    say_hello();
}

class Cuboid {
    constructor(length, width, height) {
        this.length = length;
        this.width = width;
        this.height = height;
    }

    scale({lengthScale, widthScale, heightScale}) {
        return this.length * lengthScale * this.width * widthScale * this.height * heightScale;
    }
}




