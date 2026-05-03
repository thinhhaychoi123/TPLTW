<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Khách hàng - Dashboard</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/css/admin/productlist.css" rel="stylesheet" type="text/css" >
</head>

<body>
  <div class="app">
    <!-- Sidebar -->
    <jsp:include page="dashboard_menu.jsp" />

	<!-- Modal -->
 	<jsp:include page="modal/admin/modal_product.jsp" />
    <!-- Main -->
    <main class="main">
      <!-- Page header -->
      <div class="page-header">
        <h1 class="page-title">Khách hàng</h1>

        
      </div>

      <!-- Panel -->
      <section class="panel">
        <div class="panel-head">
          <h5>Danh sách khách hàng</h5>
          <div class="d-flex align-items-center gap-2">
            <button class="btn btn-soft" type="button">
              <i class="bi bi-funnel me-1"></i> Lọc
            </button>
            <button class="btn btn-primary-soft" type="button" data-bs-toggle="modal" data-bs-target="#modalAddProduct">
              <i class="bi bi-plus-lg me-1"></i> Thêm khách hàng
            </button>
          </div>
        </div>

        <div class="table-wrap">
          <div class="table-responsive">
            <table class="table align-middle mb-0">
              <thead>
                <tr>
                  <th style="width:44px;">
                    <input class="form-check-input" type="checkbox" aria-label="Select all">
                  </th>
                  <th style="min-width:220px;">
                    Tên tài khoàn <i class="bi bi-caret-down ms-1 text-muted"></i>
                  </th>
                  <th style="min-width:220px;">
                    Email <i class="bi bi-caret-down ms-1 text-muted"></i>
                  </th>
                  <th class="text-end" style="min-width:120px;">Hành động</th>
                </tr>
              </thead>

              <tbody>
              <c:forEach var="user" items="${users}">
                <!-- Row 1 -->
                <tr>
                  <td>
                    <input class="form-check-input" type="checkbox" aria-label="Select row 1">
                  </td>
                  <td>
                    <div class="product-cell">
                      <div class="thumb">
                        <img alt="thumb" src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxIPEBAQEBIQFRUVDxAPEA8VEA8QFQ8PFREWFhUVFRUYHSggGBolHRUVITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OFxAQGi0fHR0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIALcBEwMBEQACEQEDEQH/xAAbAAACAgMBAAAAAAAAAAAAAAAAAQQFAgMGB//EAEEQAAIBAgMFBQUFBwIGAwAAAAECAAMRBBIhBTFBUWEGEyJxgTJSkaGxB0JicsEUI4KSotHhM7IVNJPC8PFDU2P/xAAbAQACAgMBAAAAAAAAAAAAAAAAAQIDBAUGB//EADURAAICAQMDAwIDBwMFAAAAAAABAhEDBBIhBTFBBhNRIjIUYXEjM0JSgaHRJJGxFRZDweH/2gAMAwEAAhEDEQA/AOt2Rgu6pKvE+JvzGbFHn9EzLJCoCIrDacntrHd/UCU9VBsv4nOl5FuxNHTYPDd3TROSgHqeJ+MadDo3ZZLcG0VoWPaFo7FSC0VkWgtHYUK0VhtDKIWFBlhYbQywse0yyQse0WWFj2jCxWFDKwsNoZYWG0LRWBGxWMSnoxJY7kXVj6cB1Moy6mGPu+Ta6Do2o1j+lUvl9iMcXVbcqIPxXqN8BYD5zXz6jJ/aqOr0/pLBH97JyEHq7+9PlkpW+ko/GZe9my/7f0CVbP7m/C4ps2RwtyCVYXGa28EcDM7S6x5JbZHN9a6BDTYnmwvhd0TbTY2cjQZYwoWSAUBWFioWWDYJBlhY6C0VhQ7R2FBaMjQssVhQWgFBiayUhmdgo68fIcZAtZQ4ztIBpSW/4m0/pEGyG4gu2KxWlnK8gMif5kApsudkbEFGzvZn4ck8uZ6ySGoFuRGOhWjChEQAdoAFo6EFoUAWhQBaFBQZYUAWiGMCKh0GWA6HlgFDCwHQmsASTYDUk6ACKUlFWyzFhllkoQVtlRX2g1Xw0bqvGsRq35Ad3mZqtRrW+IHb9M9Mwx1k1PL/AJf8mFKgq7t53sdSx5k8ZruXyzq4xUVtiqRsgACA2FPWtRHV29BTYfqJk6T96jVdbaWhy38Fxlm+PLaC0kFBlgFCKwDaGWIVCyxBQZYBQZIBQrSSYqDLAKDLGOjn8JsxsU3f4gmx9imDbw/oJXyQq2XWHwVKn7CIOthf475JRJJIkC0KJcDvDawsLySQWImFAKFCETCgETGRDNAYZoCC8YwvAQ7xUMYMRJGV4hhFQGvFYlaSlnNhu5kngAOJlWbJHHG2Zmi0WXV5FDGiors1fWpol7rS+hc8T03TSajUSyv8j0XpvSsWij2uXlmYExza2EAMVUgm5JudBp4eggDMoAbNlrmq1H4KBSH5jZm/7ZsenwuTkct6p1KjhjhXeXJbXm4OCETHQBeMLQXEVBYXioLFeKhWF4UFhmhQWYkyVBwGaFBwPMIUPgg4HGrVUFSNwuvEHyhaK0SZJMYGABGMLRAwEAHGAWgIVoCoLQCgtAdCtAKC0ACIQ4AFzCho04vFikuZvJVG9m5ASjNmjijbNj07p+XWZVCC48v4K9FZ27yrq33V4UweA69Zz+fNLJK2el6HQYtHj2QXPl/JtMqRmijAIAEAE7WBPIEnyEQEjZaFaSk72vUbzY3+lh6Tf6LHtxI819R6r3tbJLtHgl3mbRoAvAXI7wGEACAAYCFGFAYh0KMYRAOFBRzlTYFRWvScdCSym3mJVsZXT8D/AOHYwf8Ayk9O9b9RHtkFM11KuLo6nPbraoPWL6kDsl7P7QgkLVUC+mcHT1HCNTJRn8l+LSxFgaRgAtAB2EBCsIDDSILQWEYuAyiAgyiIfArQDgCICI+MxC0lzHXgqjezcAJVnzRxRtmw6d0/JrMqhDt5ZWU0Zm7ypqx3DhTXkv8Aec9mzPLK2em6LR49JiWPGv1/M3ypJmU3RS7R7VYPDtkespe9u6pg1XzcrJex85YsM34MeeqxR4bLXC1hURXAcBlDAOpRgDzU6gyEotOi6E1JJo2xEjme1naRsE1MKF1F271KqpUB3KlZbhGFjow4jdL8WJSXJh6nUvFVINk9rMPj17qmclViqGixXNqwBKkaOLX1Hyg8DUkgjrsbhKXZpM7e4E6KEaSSPKc+TfklJ+WwzSdFNheFBY7woB5oUIM0KAd4ErCAg0gMekVDsNIUFj0hQWQ8K90Q80U/KSSshwbbyW0AvCgKHtDs9QO9QW1GcDcb8bc5TkglyQZP2FWLUVvwuvoDpJQ5ROLLHNLKHYZobQsWbzhtEPN5xUAZoUMM0NoWBaPaAZ4toWLPChWa6+JFNSzbh8SeAHWVZcixx3My9FpcmqyrHBcsrKYZ27ypv3Ku8U15efMzm8+eWWVs9T0Ghx6PEscO/l/LNrmwJFr2NgTYE9TwlS7mW2eXbRxGP2m7UqJLrcqxpM1LC09dxqGxrH5cgZnJQguTSznnzSpf/C47OdgGwy3fEsrH2jQVabdV75gWt5ZZCeoXgvw9PceZM7LZ2CWggpoXIBJzPUeoxJ33ZjeY0p7mbDHjUFSJUiTNdakrqUdVZSLMrAMGHIg74JvwRlFPuee9puwSLVp1sErg5izYem+RvCM2aixvlYW0G7laZuDM5PazUa/Swx43kjwv7HoHZ8VP2aka1R6jFb53pGi5U6qKiE6OBoZvcKairPOdaoe89iosfjLUYdDjHQfGAUHxgIPUwAY9YUNBfqYqGMHzhQBfz+UNoBm846AeaKgKXYOLBTITqu7qshidlSZaF5dQ7APCgbKzb2JApZOLEacgDe/ylOXtQWStm0u7pIp32ufMm5+snCNILJPeSdC3D7wR0PcLvIqDcGeKgsA0bVDVmh8fTU2Li/EC7W87TFnq8MHTZtcHRdbmjujDg2UcSr6qwPOx1HmOEsx5seT7XZjarQ6jTP8AaxaM88vRhbhPUABJOgFyeQkZtRVssw45ZZqEFbZWKxrN3jXyj/TX/vPWczq9S80vyR6p0fpcdDhV/e+7JMwzbDjFRiqgAAAADcAAAPSNtsVIyiGAgMLRCMdn4evjHdMKFCoxSpi6gJpo4vdUQWNVgbAi6gbr3BEyceBvlmBqNasbqPLOgpdhsOcrV3xFZhexNZ6Ki++yUSot53PWZcMcY9jVZtRPKqk+CQ/YzCfcFemeDJisSLHnlZip9QZcskl5MGWmxS7xRz+1cFX2eDUqua+GB8WIyKlXDL71ZV8Lpvu6gW4ra5GTi1LupGq1fSYtbsXf4Nmcc9PjpM9c9jm5XF0xZxHRHcAcR0G5DNSFBuDvBChbg7wQoe8O8EKYbwzwoNwd5Cg3Bnioe45vGYN6b56d7XvpvX/EpnjcXaK7M02wwFmUH4iKOWXwSM/+IVnFkS3XU/M6SW+UuEhWjbhMDZu8qnM28a3AkoYvLI2WHeS/aKx54UFhnhtCwzx0FjvE0kNckSpUNUlVNlBszDQueKg8poOoa1tuEGeg+n+hRhFajOrb7I206YUWAA6Cag7Awr0L2ZTZh7LfoeYk8eSUHcSrPgx54OGRWmbMPXzLfcdzDkw3idTpc6zY1I8m6voJaLUPH48Eeu3etk+4p8f4m93yHGanqWq3P24s7D0z0j2oficq5fZEkLNQdezGtVVFZ3YKqi7MSAFHMkxpNkZSUVbNuBwOKxNmo0MqHdVxDNQDDmtPKXP8QXoZkR07fc1+XqEI8R5JzdlcZvFbCH8Hc11/rzn/AGyz8Mvko/6lL4KrHd7hSoxdLugxCrXVu9oM50C95YFCeGdVuSALmVSwNdjKw62E+HwbZT2M4i7TZ8gSkbVKr08PSa18lSq4QORxC3LfwyWKO6SRRqcnt43I9H2Vs+nhaNOhSFkpoEUXubDiTxJNyTxJM2SObbt2S4wOc+0PFV6Oy8bVwubvloEoVF2UXGZl6hcx9IAVX2QbWxGO2TSq4ss795VpCo41rUlawJ97it+OWAFVTw4w1XE4UexRrZaI5UHprVRR0XOUHRBNpo3cK+DketYVDNuXk3Z+szNppbFmj2gGaFDseaOgDPFQgzR0AZpHaAZ46AM0KHZHDSdELFeG1ByPNCgAPChjzx0As8KItjzQHYZ4qCzViKptZd7HKvS+8+gvMDqGb2sTruzf+ndD+L1a3L6Y8sh7b2umAo5spdgpKUlsC1rXYngtyLnqBqTOXhByZ6jkyLHHg8/x3aHF1yS9Z0B3U6RNJV6XHib1Mm5RXCQo4pSVzZadjMRXqVatMYqrmFNatNajd/TcA5XVg3i+8nssI2049itwlGdJnZu7pYkKHqAKQCWVanMEgXFunASzBqpYFJR8mPruk49c4Sn/AAOyZh6QRQo4ceZ4kzEbt2zZJKKSXZGTMACSQAASSdAAN5MErBulZa9ktijEZMbiFNr5sJQYaInCu6n77bxf2QRuJMz8WJRRodXqnke1djtLS6jBCMZqxWHSqjU6iq6MpV0YBlZSLEEHeImB5xUwRweIqYMlmQKtbCuxJJw7EqaZY6s1Nha51ysl7m5mHnhXKN3oNQ5x2vuhKbYzZl937dY+ZwtcL/Vli0/3Euo37R6aJnGiHABWgAlUAAAADgBoBADzCpixXxOMrr7L4lkpnmlFFo3HMFqbkHkRNtoYVCzkeuZN2dR+EZ5pmmjC8YBeFBYXhQCzR0KwzQHY80KAReFCsM8dEbZqDyVDGXhRKxZ4UKwzwoW4WeOgsM8KCxh4qGmBeG0TYsN4qjHgoCj8x1P6TlerZ9+bauyPUfS2i9jSe4+8+Tk+37hSlPMSarCo+7w0aQARB0LsW8wZgxdRN/KG6aRyEqsySVsrH/suIpV+CtZ+tJtH+A181EshzwVZeFa8HrFdM6aHkynrvBlTVFmOQ8PUzKG+I5HiIhyRH2hQ79sPhvu18VRo1B71AE1Kq+qU2X1l+BXIwddJxwuvJ6mo00mwNAeR9h+3mMxfaDGYKqwNANikp0sijuO5fKpzAXNwNbk6mAHrsAAwA4vt0oGKwDce7xifwnuGPzUTH1H2md05/tSi2jQZ0BpkCoj069EncK1Jw6ZvwkrY9CZiY5bZWbfPi9yDid/sDbVPG0u8p6MPDWokjPQq21RxwPI7iLEXBBmxTtWc5OLi6ZZyREV4AcT2o7WB82EwT3chlrYpdUw67mWm2563CwuF1J1AU2YILLNRsx9Zlnp8DyqNnP4emtNFRAFVVCKvAKBYCdAoxhGuyRwc5Tz5LXLZl31/ZBby3fE6TX5up4cfZ2zfaL0xq9R9U/oX5j/ee4vln1+kwf8ArPP2m6foyG3jLz+gLVzcwRvB3gzb6bVQzxuJyfU+lZtDPbkXD7MeaZaRq6EXhQwzwoVhnhQWItHQxZ4hGN5MAvAKCBKgvAVCJgFBAe0IBtC8jJ0myeHHvyRj8tGzZi/u78WLN8TpODzT35JS+T23T4liwwh8JHnnbDEd5jq3KmtOiPRc5+b/ACkpcRQYleST/oU8qMkUadckWr4PQewW1u9ofs7Hx0QFF/vUT7B9PZPkOcsmrW4x4Om4F+vgqEcH8Q6NxH6/GUmU+YmyriFoVMPiH9mjiEqOdPBTIam7noq1Cx6Ay7A6kYOthuxOj0tZsEc8VmB7O4WhiK+LpUUWtX/1qovd+POwuQCbWudTGBawAUAOA7S4oV9oWXVcLQNIm4t39co7r5qlOl/1Ji6iXFGz6djduRGbdpMM3CIi01Zw92p1QAO8pu1N8o3DMpGZehuOknHK49ivLp4ZO6JXf4zhtDFgcsmBa3qaN5Z+IkYj6fiNVbDvV/5iviK+litSqQjDrSQKh9VieeTLIaLFHwacYoAVUAzKRkQC1huI6C0jjzPHNTXdF2bSwz4ZYpLhmmuyUlz4h1VeAJst+XNj0mTm1ubUPn+xrdF0jR6BXFW/llQ3bnCD2BXccGSlZT5ZiJjPC/LNis6fZNlhsztVhcQwRXKOdyVFNMseQJ0J6AyLxyS+RrNG6fBMxq5WRuZKHroSPp85m9MyOOoivk1PqHTRz6CbfePKETOxSPIzG8YgvAY4DoRgKgvAlRiYEGggCQwYEkO0CdCMCLQ4EkuBQDsYYg2ViPdP0mLrJ7cE3+Rs+kYvd1uKP5ljQWyqOSgfKcQexSPIMdUz18Q9/axFc+neMB8gJZkfKRTp/tv5NUrMgIBRIwGOfDVUr0/aXeu4VEPtIfP5EAy2L8MoyQv6l3R6lQxKYuglWibggOh4qw3qeRvcESuUaZLFNMlaOlmXRlsykbwRqCIl3JSS7Fh2e7QnBKMPis7UV0o4uxqGnT4U64Hi8O4VLEWHisRc5+PMnwzQ6nRyg248o7XB4unWQVKTpUQgFXRldSDxBGkuswmqHicVTpAtUdEA1LMyoAOpMYjk9qdsRVBp7P8AHfQ40r+5pi2+nf8A1m10t4eZ0sap5VEysGknlfPCOewFIICq3ygnxE3apUJJd2PFiSSTxN5gSm5OzfwxxxxUUSpEmY1KYbeP8eRiHY6a2FtfUk/WAmNrkG2nXlARrVFQE6DizE8uJJhVg5cHnXarbyYioy4YeG3d1MTrmqJxSl7qHiRbN5TIi9iMWUfel+RQDTQbuAlLk2zLUUlSLrsZhVrY0K6qyrh6zMrAMDfKguD5mWwdQbMfKlLJFM9CxaACko3BtBqdAh4mX6BOWpiYXWJKOgy/pRqYztDxxigKgEQ6MoybSFaFBtQ7QJUYho6EF4UAXhQBmjoBZoUA7woBFoUBrrtcW5sg+LCa3qr26aR0fpeG7qEfyTZcCccu56hLyeKUTcX5lmPmWJ/WWZfuIaf92jOVl4QAIWKi27N7dbBVDe7UnI71BqVO7vEHPmOI8pYmpcMomtjtHpuFxKVUWpTYMrC6sDcESDVEoyUuTbESIb7JoMxc0aWY+04RVZvMjUyaySXkqeDG+6MKexcMrZxh6Ob3+7QsP4iLweST8jjgxx7IlVUY2ANhxPHyEhZbGkZqtgANw3RB3HGAQAIAV+2NtUMGuas9ifZpr4nf8q/rukowciqeRI87292grY0lW/d0r6UAfa61D97y3ecstR7EVjlPmfb4Ky0qbL1GlSFIkjs/s2wv/M1zxZKCeSDM3zYD+GXviKRix5yOR0+Ne7ge6vzY/wBhNl0bE5Zt3hHP+q9T7Wi9td5s1qZ1R5nQiYUAXgAZoUAXjALwCzXeSHQXjCh3iARgMVzHwJ2AgFATaFCfBj95fzp/ump61xpn+p1PpFf6/wDoy5bcfKcej0iXZnimF9hPyj6SeT7mGD7EbZAuCABAAgBN2Ptitg3zUiCpN6lFj4H6j3W6j1vLFNPhmPPG07iegbE7UYfF2UN3dXjQchWP5TuceUJY33XYjHMr2y4ZdmVlyCAwiAIxCgMrdqbew2F/1aqhuFMeNz5IusmsbZVLLGPk5HavbatUuuGTuV/+18r1COi7l9bySjGPfkj+0n24OYcksXYszH2qjEszeZMjKbZbDEoBIWWUERITE20FzuA4sx0AHmbScFbK8ktsWz1nYWAGFw1KlpdUu551D4nPxJkpu2VYlSRHz5iWP3iT6bh8p1fR8Dx4dz8nnfqvWLLq1ij2h/yObU5ULwYUEBijEItGHCCKhUhZo6G2LPHQk2AaDQWINCiNtAXhtHuDPHQtzGTFQ7C+qfnT6zUdaX+mf6nVeknWv/oy7nHo9JfY8VRMt191mT+Viv6SeX7haf7EZSBcAggCDAIDEYITPRPsY2dRxNTaNPEUqdVTRwgyOquLZ6x3HqBM7B9pouousiO9r9hFU3wuJxFEa2osRiaQ8hU8YHQOBJyxRkY2PV5YdmVtfs5tOnon7BXHvZ6+EP8AJlqD+qVvTxMpdSku6K7bVHaGDw9XE1cNgwlJDUe2OqEkDgo7jUk6Dzkfwy+Sa6k20lE4av25xTexToU/PvKp+qiUfQjPSyyXhFPjNsYqtfvMRVsfuIRSX4JY/Ew9xLsiSwN/dJkBKYXcAP18+ci5tk44oR7IykCxDgMIwCAF92J2b3+K7xh4KADn8VZvYHpq38stj9Mb+TFyPfNR8I7/AGjUsuX3jl/h4n/znJabE8uVQXkhq9RHT4J5X4RAvO9hBQiorweNZ8ry5JTl3bEXkqKtwGpDaDkHeR7Rbgzwoe4A0KDchZoUPcjXmkg4GXiodgGEKDgRaMjJWLNAKHmhQJIYaKiXBiz/ACsfgbzA6pj36aaN36ey+31DH+fB0IM4VHq7PIts0e7xWJTliKhHk57wf75bk5plWB1a/MiyoyBCNAEGARAEaBnbfZBtdMNtE06hAGJpdyrE2ArI2dB/Fdx52HGZmnl4NP1LE3U0e9CZRqBGAHkv209p1ZV2bSYFs6VcWQdKar4qdM/iLZWI4BR7wlOWajEzdFgeSd+EeUzXHQocBigA4AEYBABWJICgsxIVVG9mJsAPWOKtkMktqs9V7ObKGDw6UtCx8dVh96q3teg0A6ASWSVlOKLS5NWLr5nJ4Dwr+pnRdD0vDyv+hxvq3qFKOlj+r/wR8wnSUcHSDNAKDNAVBeA6DNAAzwCgvAdIwjEIwEOAGMYBGMIhBEBsp0y5yjeQfhNV1bVRw4XHzI6T0106eo1UcnaMOS9wrXRb77WPmNDOISPUpdzzvt5hsmNzcKtFH82QlG+WSXd4WUR4yNfJQysyUIQAZgKxQGEAF/gjgQRuIPAyUZNOyE4KSp9jt9h/alj8MoSr3WJUCwNTNTqAdai6N6rfrMiOp45NXk6Zb+lkja32tY2shSjToYe4sagL13HVcwCqfMGSepVcEYdLd/U+DgSSSSSzMzFmdiWZ2JuWYnUknjMWUnLlm0x4owVRCQLQjAIUAWgAQAIAdb2B2Nnb9sqDwi64dTxO5qv1A9TylzW1UYtvJK/COw2liMiG286DpzMlpsDzZFBEdXqYabDLLLwU073DiWKCgvB45rNTPUZpZZ92EtMYLQHQiICaCMVhAYoDscKHYBoUFCzQoVBmhQtos0dBTHmgG0LwHQXkMk1ji5Psi3BgnmyLHFW2XGzMPlXMd7fJeE4HW6p6jK5Pt4PYOm6CGi08cUe/n9SaBaYZnnJfaNhM1ClXG+lVAY//AJ1PCf6sktx82ijL9LjL4OGaVsyUxQJDMBCiAIwCABAAgAQAIAOMAJiAUACAFl2e2M2NrZNRSSxruNNOFNT7x+Q9JZFUrZjZJ73tj/U9SAWmtgAqqoAA0AA0AAibssjHwijxOJzsWPkByE6romkjHH7vlnA+rddkeX8MuEv7mkNN9RxdDDCFAPvIUOxF4UAs0Ytos0AoLwoKYrxhRqzSRbQFogoA0YUBMKCgzQoKDPCgaJuy8P3ja7hqevITluu67/wwf6neelulbY/isi5fb/JfzmDswjAjbSwS4ijVotudGQ9LjQ+h19I4unZCcd0WjyHKylkfRkZqbjk6mxkpqmGGdx/QJWXWEYBAAgAQAIAEACFDQzGIUQwgIIDJWytm1MXV7ql0NSpbw0UPE8zyHGTjHyzHyzf2x7nqmytn08NSWjSFlUbzvZjvZjxJilK2LHDaiRUphrX4G485Gy1Ojnto08tRh1uPIzrOgZt2N4/g4T1hpmsmPOvPDIuadHRxdBmiFtDNAdCzR0FBmioKHeMdBmgFBeIVDxOFamcrix+N/IyOPLHJzEsljcTTLaI0LNHQ6GKkVAPPFQGVFSzBRqSZhdR1a02Fy8+DadH6a9bqFD+Fcs6jCUBTUKPU8zPPpzc5OT8nq0IRhFQj2XCN0iSCADgI887fbL7qsuJUeCtZKv4awHhb+IC3mvWW/dH9Chfs8l+H/wAnPYfDtUNkUnyH6yk2OPTykrJY2PWt7I/mEVl34SXyRa+HembOpEZTPBKHJqtGVBaAgiAIAEYBAAgAQAnbF2RVxrlKWiqQKlYi6p0HvP0+MsjGlbMeeVt7Yf7npuydmU8LTFKkLDezHVnbizHiZCUrHGNE2RJUKBIqNvU9UboR8Nf7zc9EzbNSl/MaL1Hp/d0En5hyU5M7c8vC4hQCjSChRhQrwHQZvOFCod4UFCzR0gosMbUIw1JKl8+csAd4p62vy6eUwcEV70pR7f8AsyZ/bT7lXmmwooDNChheFAF4pUlbHGLlJJeS/wBhYSw7wjfovlxM4Dq2tepzOvtj2PU+i9OWi06X8UuWW81RtgjAxqVFX2iB5kCIEmxo4bUEEcwbwA0bSwKYik9GoPC62PMHeGHUEAjyk4yplc47lRyGEU081FwBUpkK4AsHH3aijkw187jhCcfKNpos++G190SZXRms116C1FKsLj6QF34KGnsQl2GawDW3XJFriFlD0sWyQdgLbR2v1AhY/wALAq8dgXo+1qODDdGY+XTOPK7EQQMUdoxCgAmYAXO7nGlYpSUVbOg7PdlamKtUrZqdHeB7NSqOnuL138ucs4h+pjOUsnbhHoeEwqUUWnSVURRZVAsBIOTZZGKSpG60gSoUBhGBA23TvSvyYH03frMjST2ZoS+GU6nH7uDJB+UzmCZ6Uqas8cmnFtfAXkqIheFAPNCgETCgsV46ALxAO8dADuWJJJJOpJNyT1kVFLhEnbFaMFEUYqGIBRK2dhTVcDhvJ5Cc917Xe1j9qHeXf9DrPTHTPdyfiMi+mPb82dYi2AA5WnFHfscYgiA10qIW53nix1J/tAbZrqDLUUjc11YdQLg/WBJcokRlZU7d2Sa+WrSIWsgIQn2aiHfTfodNeB9ZOMvDEm4yUo9yipVrkoylHX26TaMvXkRyI0MjKLRt8OohlX5/BsvIF5iFFyeJsD6f+4mSMpEZhWpB1KsLgi0aYmcfiqJpuyHgflJGr1ENsuDCSSMe6N2z8FVxLZMOhcg2ZtyJ+Z9w8t8sUPLKpZl2jyzudgdjqdAipXIq1RqNLU6R/Ap3n8R9LRudcRILG5O5uzp5VZaBMANP7VT99P5hES2s3AxiNFWoc2RbbszMdco4aczYwsklxbHikzU3Xmp+NoWKPc4+pvnpWiye5ghL5R5L1TB7OqyQ+GYzLNftCINoRiaCLsPaELDaEA2hHZGmKBZYrQHY4BYWvK8uRY4Ob8FuDG82SOOPdujqdj4Xu6YPEgE+XCebavUS1GaWR+T1nSaaOmwQxR8L/dk+Y5kBAAgAQA0Y3ch5VE+Zt+sTJwN7C4/WBWQ/24ISj3LDQWHtcvKFlqxNq0R8fhqOJyrVRlbXu6gIV0P4WU3HluMlGdEHjfdMqcRsvEUblctdBrcFaVVR1BIVvMEeUlUZdi2GsyY/v5RXYfadKoSqscwNipVgQfp85GWNozcesxz7E0CQ2mR7iNGLxSUgWqNYc7MfoJJY2yrJqYQXJWHY1fG1DUoIopkD967hRu90Xb5CWKCX3Gr1OrWVrYi82Z2FpKQ2Idqx9wXp0/gDdvU+kN6X2oxvblL7mdTQorTUIiqqjRVUBQB0AkHJvuWJJdjORJidgoJO4C58oMO5GpoanifdvVOFubczAm6iSFpi1iB8OEBWRmTuSCvsEgMvuknQj+0CS+oywhvnfm5+C+EfT5wFNVwSYFZxuPp5ajD8RHznddAybtLXwzz71TiUNapfzI0TeHODtABWgHAEQEAEAC0QggKz/9k=">
                      </div>
                      <span>${user.userName}</span>
                    </div>
                  </td>
                  <td>${user.email}</td>
                  <td class="text-end">
                    <a href="#" class="text-decoration-none text-primary fw-bold">Sửa</a>
                  </td>
                </tr>
			</c:forEach>
              
              </tbody>
            </table>
          </div>
        </div>

        <!-- Pagination (mÃ´ phá»ng) -->
        <div class="panel-foot">
          <button class="btn btn-outline-secondary rounded-pill px-4 py-2" type="button">
            <i class="bi bi-arrow-left me-2"></i> Trở về
          </button>

          <div class="page-numbers" aria-label="Pagination">
            <span class="dot active">1</span>
            <span class="dot">2</span>
            <span class="dot">3</span>
            <span class="px-2">...</span>
            <span class="dot">8</span>
            <span class="dot">9</span>
            <span class="dot">10</span>
          </div>

          <div style="width:200px;"></div>
        </div>
      </section>
    </main>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>