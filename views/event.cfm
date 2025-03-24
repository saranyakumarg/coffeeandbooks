<!DOCTYPE html>
<html lang="en">
<cfinclude  template="layout/header.cfm">
<cfset eventItems = variables.allEvents>
<body>
    <cfinclude  template="layout/nav.cfm">
    <cfoutput>
        <main>
            <!-- Events Section -->
            <section class="events-section">
                <h2 class="section-title">Upcoming Events</h2>
                <div class="event-list">
                    <cfloop array="#eventItems#" index="event">
                        <div class="event-item">
                            <div class="event-image-container">
                                <img src="#event.getPhoto()#" alt="#event.getName()#" class="event-image">
                            </div>
                            <div class="event-content">
                                <h3 class="event-title">#event.getName()#</h3>
                                <p class="event-description">#event.getDescription()#</p>
                                <p class="event-time"><i class="fas fa-clock"></i> #dateFormat(event.getStartTime(), "yyyy-mm-dd") & " " & TimeFormat(event.getStartTime(), 'hh:mm tt') & " - " & TimeFormat(event.getEndTime(), 'hh:mm tt')#</p>
                                <a href="##" class="event-button">Learn More</a>
                            </div>
                        </div>
                    </cfloop>
                </div>
            </section>
        </main>
    </cfoutput>
    <cfinclude  template="layout/footer.cfm">
</body>
</html>
