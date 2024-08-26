using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP07_Dominguez_Minuchin.Models;

namespace TP07_Dominguez_Minuchin.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
}
