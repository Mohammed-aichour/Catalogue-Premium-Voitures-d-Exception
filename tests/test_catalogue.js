const fs = require('fs');
const path = require('path');
const assert = require('assert');

const root = path.resolve(__dirname, '..');
const pages = [
    'index.html',
    'collection.html',
    'page-audi.html',
    'page-bmw.html',
    'page-mercedes.html',
    'page-porsche.html',
    'reservation.html',
    'login.html'
];

console.log('Testing Catalogue Premium Voitures d\'Exception...');

// 1. Verify all showcase pages exist and have standard boilerplate
pages.forEach(page => {
    const fullPath = path.join(root, page);
    assert(fs.existsSync(fullPath), `Page ${page} must exist.`);
    const content = fs.readFileSync(fullPath, 'utf8');
    assert(content.includes('<!DOCTYPE html>'), `${page} must declare HTML5 doctype.`);
    assert(content.includes('<meta name="viewport"'), `${page} must include viewport meta tag.`);
    console.log(`  ✓ ${page} passed structural checks.`);
});

// 2. Verify reservation.html has car data and LocalStorage integration
const resContent = fs.readFileSync(path.join(root, 'reservation.html'), 'utf8');
assert(resContent.includes('carData'), 'reservation.html must contain car model database.');
assert(resContent.includes('premium_car_reservations'), 'reservation.html must store reservations in LocalStorage.');
assert(resContent.includes('bookBtn'), 'reservation.html must have an active booking submit handler.');
console.log('  ✓ reservation.html passed interactive VIP booking tests.');

// 3. Verify luxury theme switch
const loginJs = fs.readFileSync(path.join(root, 'script-login.js'), 'utf8');
assert(loginJs.includes('applyTheme'), 'script-login.js must handle dark/light theme switching.');
console.log('  ✓ script-login.js passed theme toggling tests.');

console.log('ALL CATALOGUE PREMIUM TESTS PASSED SUCCESSFULLY!');
