{{template "base/base.html" .}}
{{define "body"}}
  <div class="right-content-container">
    <div class="header">
      <ol class="breadcrumb">
        <li><a href="/">Home</a></li>
        <li><a href="/registries">Registries</a></li>
        <li><a class="registry-name" href="/registries/{{.registryName}}/repositories">{{.registryName}}</a></li>
        <li class="active">Repositories</li>
      </ol>
    </div>
    <div class="content-block white-bg">
      <div class="row">
        <h1>Repositories</h1>
        <hr>
      </div>
      <div class="row">
        <table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
          <thead>
            <th>Repository Name</th>
            <th>Tags</th>
            <th>Last Modified</th>
          </thead>
          <tfoot>
            <th>Repository Name</th>
            <th>Tags</th>
            <th>Last Modified</th>
          </tfoot>
          <tbody>
            {{range $key, $repository := .repositories}}
            <tr>
              <td><a href="/registries/{{$.registryName}}/repositories/{{urlquery $repository.Name}}/tags">{{$repository.Name}}</span></td>
              <td>{{len $repository.Tags}}</td>
              <td></td>
            </tr>
            {{end}}
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <script>
  $(document).ready(function() {
      $('#datatable').DataTable( {
          "order": [[ 1, "asc" ]],
          "pageLength": 25
      } );
      $(function () {
        $('[data-toggle="tooltip"]').tooltip({container: 'body'})
      })
  });
  </script>
{{end}}
