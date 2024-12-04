<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>거래명세서</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .header {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>거래명세서</h1>
        <p><strong>거래일:</strong> <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></p>
        <p><strong>거래처:</strong> <%= request.getParameter("customer") %></p>
    </div>

    <table>
        <thead>
            <tr>
                <th>품목</th>
                <th>수량</th>
                <th>단가</th>
                <th>총액</th>
            </tr>
        </thead>
        <tbody>
            <%
                String[] items = request.getParameterValues("item");
                String[] quantities = request.getParameterValues("quantity");
                String[] unitPrices = request.getParameterValues("unitPrice");

                double total = 0;
                
                if (items != null && quantities != null && unitPrices != null) {
                    for (int i = 0; i < items.length; i++) {
                        String item = items[i];
                        int quantity = Integer.parseInt(quantities[i]);
                        double unitPrice = Double.parseDouble(unitPrices[i]);
                        double totalPrice = quantity * unitPrice;
                        total += totalPrice;
            %>
            <tr>
                <td><%= item %></td>
                <td><%= quantity %></td>
                <td><%= String.format("%.2f", unitPrice) %></td>
                <td><%= String.format("%.2f", totalPrice) %></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
        <tfoot>
            <tr>
                <th colspan="3">합계</th>
                <th><%= String.format("%.2f", total) %></th>
            </tr>
        </tfoot>
    </table>
</body>
</html>
