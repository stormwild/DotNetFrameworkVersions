# DotNetFrameworkVersions

## Pre-requisites

- .NET 5
- Visual Studio 2019

## Setup Notes

1. Create folder using gitbash on Windows.

```
mkdir DotNetFrameworkVersions
cd DotNetFrameworkVersions
dotnet new sln -n DotNetFrameworkVersions
```

2. Open in Visual Studio

3. Create database using SQL Server Object Explorer

4. Import Database to Create Database Project

5. Add .NET Core 5 Web App MVC project to the solution

6. Add Entity Framework

	```
	Install-Package Microsoft.EntityFrameworkCore.SqlServer
	Install-Package Microsoft.EntityFrameworkCore.Tools 
	```

	Scaffold Database Context and Models from an existing database

	**Note**: Code below is not working

	```
	Scaffold-DbContext "Server=.\SQLExpress;Database=YourDbName;Trusted_Connection=True;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models
	```

	Tried using dotnet from command line.

	```
	dotnet tool install --global dotnet-ef
	dotnet add package Microsoft.EntityFrameworkCore.Design
	dotnet ef

	dotnet user-secrets set ConnectionStrings.DotNetFrameworkVersionsDb "Data Source=ServerName;Database=DotNetFrameworkVersionsDb;Integrated Security=True"
	dotnet ef dbcontext scaffold Name=ConnectionStrings.DotNetFrameworkVersionsDb Microsoft.EntityFrameworkCore.SqlServer -o Models
	```

7. Configure DbContext in Services

	```csharp
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();

            services.AddDbContext<DotNetFrameworkVersionsDbContext>(options => options.UseSqlServer("Name=ConnectionStrings.DotNetFrameworkVersionsDb"));
        }
	```

8. Inject DbContext into Controller

    ```csharp
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly DotNetFrameworkVersionsDbContext _context;

        public HomeController(ILogger<HomeController> logger, DotNetFrameworkVersionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            var versions = _context.DotNetFrameworkVersions.ToList();
            return View(versions);
        }

    }
    ```

9. Modify view to display the data

    ```csharp
    @model IEnumerable<DotNetFrameworkVersion>

    @{
        ViewData["Title"] = "Home Page";
    }

    <div class="text-center">
        <h1 class="display-4">Welcome</h1>
        <p>Learn about <a href="https://docs.microsoft.com/aspnet/core">building Web apps with ASP.NET Core</a>.</p>
    </div>

    <p>
        @*<a asp-action="Create">Create New</a>*@
    </p>
    <table class="table">
        <thead>
            <tr>
                <th>
                    @Html.DisplayNameFor(model => model.Id)
                </th>
                <th>
                    @Html.DisplayNameFor(model => model.ReleaseDword)
                </th>
                <th>
                    @Html.DisplayNameFor(model => model.WindowsVersion)
                </th>
                <th>
                    @Html.DisplayNameFor(model => model.FrameworkVersion)
                </th>
                <th>
                    @Html.DisplayNameFor(model => model.Description)
                </th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            @foreach (var item in Model)
            {
                <tr>
                    <td>
                        @Html.DisplayFor(modelItem => item.Id)
                    </td>
                    <td>
                        @Html.DisplayFor(modelItem => item.ReleaseDword)
                    </td>
                    <td>
                        @Html.DisplayFor(modelItem => item.WindowsVersion)
                    </td>
                    <td>
                        @Html.DisplayFor(modelItem => item.FrameworkVersion)
                    </td>
                    <td>
                        @Html.DisplayFor(modelItem => item.Description)
                    </td>

                    <td>
                        @*<a asp-action="Edit" asp-route-id="@item.Id">Edit</a> |
                            <a asp-action="Details" asp-route-id="@item.Id">Details</a> |
                            <a asp-action="Delete" asp-route-id="@item.Id">Delete</a>*@
                    </td>
                </tr>
            }
        </tbody>
    </table>
    ```

## References

- [How to check your .NET Framework version](https://smartdoc.zendesk.com/hc/en-us/articles/205232308-How-to-check-your-NET-Framework-version)
- [Securely Manage Database Credentials Using Visual Studio Manage User Secrets](https://www.mssqltips.com/sqlservertip/6348/securely-manage-database-credentials-using-visual-studio-manage-user-secrets/)
- [Configuration and User Secrets](https://docs.microsoft.com/en-us/ef/core/managing-schemas/scaffolding?tabs=vs#configuration-and-user-secrets)
