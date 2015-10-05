$(document).ready(function() {
  function showPlayersTable() {
    var teamid = $('select#team_team').find('option:selected').val();

    $('table.players').addClass('hidden');
    $('#' + teamid).removeClass('hidden');
  }

  $('select#team_team').on('change', showPlayersTable);

  showPlayersTable();
});
