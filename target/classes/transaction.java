<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>�ŷ�����</title>
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
        <h1>�ŷ�����</h1>
        <p><strong>�ŷ���:</strong> <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></p>
        <p><strong>�ŷ�ó:</strong> <%= request.getParameter("customer") %></p>
    </div>

    <table>
        <thead>
            <tr>
                <th>ǰ��</th>
                <th>����</th>
                <th>�ܰ�</th>
                <th>�Ѿ�</th>
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
                <th colspan="3">�հ�</th>
                <th><%= String.format("%.2f", total) %></th>
            </tr>
        </tfoot>
    </table>
</body>
</html>
