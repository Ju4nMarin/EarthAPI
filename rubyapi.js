$(document).ready(function() {
     $.get("http://localhost:3000/features", function(data) {
        var featuresHtml = "";
        data.forEach(function(feature) {
            featuresHtml += "<tr>";
            featuresHtml += "<td>" + feature.id + "</td>";
            featuresHtml += "<td>" + feature.title + "</td>";
            featuresHtml += "<td>" + feature.mag + "</td>";
            featuresHtml += "<td>" + feature.place + "</td>";
            featuresHtml += "<td>" + new Date(feature.time).toLocaleString() + "</td>"; 
            featuresHtml += "</tr>";
        });
        $("#featuresTable tbody").html(featuresHtml);
    });
});
