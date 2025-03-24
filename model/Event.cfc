component persistent="true" table="events" { //persistent="true" → Marks this as an ORM entity
    
    // Primary Key (Auto-increment)
    property name="id" column="id" type="integer" generator="identity";
    
    // Event Name (Required)
    property name="name" column="name" type="string" length="255" notnull="true";
    
    // Start Time (Required)
    property name="startTime" column="start_time" type="timestamp" notnull="true";
    
    // End Time (Optional)
    property name="endTime" column="end_time" type="timestamp";
    
    // Description (Optional)
    property name="description" column="description" type="string" length="5000";
    
    // Photo URL (Optional)
    property name="photo" column="photo" type="string" length="500";
    
    // Created At (Automatically set when inserting a new record)
    property name="createdAt" column="created_at" type="timestamp";
}
