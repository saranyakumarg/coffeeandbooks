<!DOCTYPE html>
<html lang="en">
<cfinclude  template="layout/header.cfm">
<body>
    <cfinclude  template="layout/nav.cfm">
    <main>
        <div class="content-wrapper">
            <div class="section">
                <h2 class="section-title">Freshly Brewed Coffee</h2>
                <p class="section-description">Our coffee is sourced from the finest beans, freshly brewed for you to enjoy in our cozy space. Whether you're here for a quick espresso or a long pour-over, we have something for every coffee lover.</p>
                <div class="cta-button">
                    <a href="menu.cfm" class="btn">Explore Our Menu</a>
                </div>
            </div>

            <div class="section">
                <h2 class="section-title">Explore Our Library</h2>
                <p class="section-description">Enjoy a good book while sipping your favorite coffee. Our library is full of classics, new releases, and cozy reading nooks perfect for escaping into a story.</p>
                <div class="cta-button">
                    <a href="book.cfm" class="btn">Browse Our Books</a>
                </div>
            </div>

            <div class="section">
                <h2 class="section-title">Special Events</h2>
                <p class="section-description">Join us for book readings, coffee tasting events, and more. Stay tuned for upcoming events and be part of our vibrant community.</p>
                <div class="cta-button">
                    <a href="#events" class="btn">See Upcoming Events</a>
                </div>
            </div>
        </div>
    </main> 
    <cfinclude  template="layout/footer.cfm">
</body>
</html>
