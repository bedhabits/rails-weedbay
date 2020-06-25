import "bootstrap";
import anime from 'animejs/lib/anime.es.js';
import "../components/cart"

import { openNav } from '../components/menu-bar'

document.getElementById('menu-bar-open').addEventListener('click', () => {
  openNav();
})

// document.addEventListener('turbolinks:load', () => {
//   // Call your JS functions here
//   openNav();
// });
