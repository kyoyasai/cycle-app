if (document.URL.match( /new/ ) || document.URL.match( /edit/ ) ) {
  document.addEventListener('DOMContentLoaded', ()=>{
    const PreviewBox = document.getElementById("preview-box");

    //選択した画像を表示する関数
    const createImageHTML = (blob) => {
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', 'post-preview');
      PreviewBox.appendChild(blobImage);
    };

    document.getElementById("article-post").addEventListener('change', (e)=>{
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}