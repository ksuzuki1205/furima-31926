import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("a");
    const html = `<p>${data.content.text}</p>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    console.log(comments);
    console.log(newComment);
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';  }
});
