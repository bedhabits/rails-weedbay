const updateItemsInCartCount = () => {
  const ItemsInCartCount = document.querySelectorAll(".message.unread").length;
  document.getElementById('card').innerText = `(${unreadCount})`;
};
