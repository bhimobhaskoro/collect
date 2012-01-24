/**
 * This class is generated by jOOQ
 */
package org.openforis.collect.persistence.jooq.tables.records;

/**
 * This class is generated by jOOQ.
 */
@javax.annotation.Generated(value    = {"http://www.jooq.org", "2.0.1"},
                            comments = "This class is generated by jOOQ")
public class UserAccountRecord extends org.jooq.impl.UpdatableRecordImpl<org.openforis.collect.persistence.jooq.tables.records.UserAccountRecord> {

	private static final long serialVersionUID = -120446523;

	/**
	 * An uncommented item
	 * 
	 * PRIMARY KEY
	 */
	public void setId(java.lang.Integer value) {
		setValue(org.openforis.collect.persistence.jooq.tables.UserAccount.USER_ACCOUNT.ID, value);
	}

	/**
	 * An uncommented item
	 * 
	 * PRIMARY KEY
	 */
	public java.lang.Integer getId() {
		return getValue(org.openforis.collect.persistence.jooq.tables.UserAccount.USER_ACCOUNT.ID);
	}

	/**
	 * An uncommented item
	 * 
	 * PRIMARY KEY
	 */
	public java.util.List<org.openforis.collect.persistence.jooq.tables.records.RecordRecord> fetchRecordListByLockedById() {
		return create()
			.selectFrom(org.openforis.collect.persistence.jooq.tables.Record.RECORD)
			.where(org.openforis.collect.persistence.jooq.tables.Record.RECORD.LOCKED_BY_ID.equal(getValue(org.openforis.collect.persistence.jooq.tables.UserAccount.USER_ACCOUNT.ID)))
			.fetch();
	}

	/**
	 * An uncommented item
	 * 
	 * PRIMARY KEY
	 */
	public java.util.List<org.openforis.collect.persistence.jooq.tables.records.RecordRecord> fetchRecordListByModifiedById() {
		return create()
			.selectFrom(org.openforis.collect.persistence.jooq.tables.Record.RECORD)
			.where(org.openforis.collect.persistence.jooq.tables.Record.RECORD.MODIFIED_BY_ID.equal(getValue(org.openforis.collect.persistence.jooq.tables.UserAccount.USER_ACCOUNT.ID)))
			.fetch();
	}

	/**
	 * An uncommented item
	 * 
	 * PRIMARY KEY
	 */
	public java.util.List<org.openforis.collect.persistence.jooq.tables.records.RecordRecord> fetchRecordListByCreatedById() {
		return create()
			.selectFrom(org.openforis.collect.persistence.jooq.tables.Record.RECORD)
			.where(org.openforis.collect.persistence.jooq.tables.Record.RECORD.CREATED_BY_ID.equal(getValue(org.openforis.collect.persistence.jooq.tables.UserAccount.USER_ACCOUNT.ID)))
			.fetch();
	}

	/**
	 * An uncommented item
	 * 
	 * PRIMARY KEY
	 */
	public java.util.List<org.openforis.collect.persistence.jooq.tables.records.UserRoleRecord> fetchUserRoleList() {
		return create()
			.selectFrom(org.openforis.collect.persistence.jooq.tables.UserRole.USER_ROLE)
			.where(org.openforis.collect.persistence.jooq.tables.UserRole.USER_ROLE.USER_ID.equal(getValue(org.openforis.collect.persistence.jooq.tables.UserAccount.USER_ACCOUNT.ID)))
			.fetch();
	}

	/**
	 * An uncommented item
	 */
	public void setUsername(java.lang.String value) {
		setValue(org.openforis.collect.persistence.jooq.tables.UserAccount.USER_ACCOUNT.USERNAME, value);
	}

	/**
	 * An uncommented item
	 */
	public java.lang.String getUsername() {
		return getValue(org.openforis.collect.persistence.jooq.tables.UserAccount.USER_ACCOUNT.USERNAME);
	}

	/**
	 * An uncommented item
	 */
	public void setPassword(java.lang.String value) {
		setValue(org.openforis.collect.persistence.jooq.tables.UserAccount.USER_ACCOUNT.PASSWORD, value);
	}

	/**
	 * An uncommented item
	 */
	public java.lang.String getPassword() {
		return getValue(org.openforis.collect.persistence.jooq.tables.UserAccount.USER_ACCOUNT.PASSWORD);
	}

	/**
	 * An uncommented item
	 */
	public void setEnabled(java.lang.String value) {
		setValue(org.openforis.collect.persistence.jooq.tables.UserAccount.USER_ACCOUNT.ENABLED, value);
	}

	/**
	 * An uncommented item
	 */
	public java.lang.String getEnabled() {
		return getValue(org.openforis.collect.persistence.jooq.tables.UserAccount.USER_ACCOUNT.ENABLED);
	}

	/**
	 * Create a detached UserAccountRecord
	 */
	public UserAccountRecord() {
		super(org.openforis.collect.persistence.jooq.tables.UserAccount.USER_ACCOUNT);
	}
}