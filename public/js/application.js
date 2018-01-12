var editor = CodeMirror.fromTextArea(document.getElementById('code'), {
  mode: 'text/x-bato',
  styleActiveLine: true,
  lineNumbers: true,
  tabSize: 2
});

editor.setSize(520, 500);

$('#run').on('click', function(e) {
  e.preventDefault();
  $('.resulta').html('<img src="/images/loading.gif">');
  $.post('/', { code: editor.getValue() }, function(data) {
    $('.resulta').html(data);
  });
});