const searchArtist = document.querySelector('#searchartist')
if (searchArtist) {
  searchArtist.addEventListener('input', async function() {
    const response = await fetch('../api/api_artists.php?search=' + this.value)
    const artists = await response.json()

    const section = document.querySelector('#artists')
    section.innerHTML = ''

    for (const artist of artists) {
      const article = document.createElement('article')
      const img = document.createElement('img')
      img.src = 'https://picsum.photos/200?' + artist.id
      const link = document.createElement('a')
      link.href = '../pages/artist.php?id=' + artist.id
      link.textContent = artist.name
      article.appendChild(img)
      article.appendChild(link)
      section.appendChild(article)
    }
  })
}



function togglePopup(number){
  if (number==1){
    document.getElementById("popup-1").classList.toggle("active");
  }
  else if(number==2){
    document.getElementById("popup-2").classList.toggle("active");
  }
}

function tryy(){
  const popup = document.getElementById("popup-1");
  const popupBtn = document.querySelector('#account-button');
  popupBtn.addEventListener('click', ()=> {
    popup.classList.toggle("active");
  })
  document.addEventListener('click', e => {
    if(popup.contains(e.target)!= e.target!== popupBtn){
      popup.classList.delete('active');
    }
  })
}

window.addEventListener("scroll", function() {
  if (window.scrollY > 200) { // Change 100 to the scroll position where you want the element to appear
    document.body.classList.add("scrolling");
  } else {
    document.body.classList.remove("scrolling");
  }
});



// Initialize slide index
let slideIndex = 1;

// Display initial slide
showSlides(slideIndex);

// Function to show slides
function showSlides(n) {
  let i;
  const slides = document.getElementsByClassName("highlighted-product");
  const dots = document.getElementsByClassName("dot");
  
  // Loop through slides and hide them
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  
  // Loop through dots and remove active class
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  
  // Ensure slide index doesn't exceed slide count
  if (n > slides.length) {
    slideIndex = 1;
  }    
  if (n < 1) {
    slideIndex = slides.length;
  }
  
  // Display the current slide and set corresponding dot as active
  slides[slideIndex-1].style.display = "flex";  
  dots[slideIndex-1].className += " active";
}

// Function to advance slides
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Function to set current slide
function currentSlide(n) {
  showSlides(slideIndex = n);
}
document.addEventListener('DOMContentLoaded', function() {
  showSlides(slideIndex);
});
