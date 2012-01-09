/**
 * 
 */
package org.openforis.collect.persistence.jooq;

import static org.openforis.collect.persistence.jooq.tables.Data.DATA;

import org.jooq.InsertSetStep;
import org.jooq.Record;
import org.openforis.idm.metamodel.CoordinateAttributeDefinition;
import org.openforis.idm.metamodel.NodeDefinition;
import org.openforis.idm.model.Coordinate;
import org.openforis.idm.model.CoordinateAttribute;
import org.openforis.idm.model.Entity;
import org.openforis.idm.model.Node;

/**
 * @author M. Togna
 * 
 */
public class CoordinateAttributeMapper extends NodeMapper {

	@Override
	Class<? extends NodeDefinition> getMappedClass() {
		return CoordinateAttributeDefinition.class;
	}

	@Override
	void setFields(Node<?> node, InsertSetStep<?> insert) {
		CoordinateAttribute c = (CoordinateAttribute) node;
		Coordinate value = c.getValue();
		if (value != null) {
			if (value.getX() != null) {
				insert.set(DATA.NUMBER1, value.getX().doubleValue());
			}
			if (value.getY() != null) {
				insert.set(DATA.NUMBER2, value.getY().doubleValue());
			}
			if (value.getZ() != null) {
				insert.set(DATA.NUMBER3, value.getZ().doubleValue());
			}
			insert.set(DATA.TEXT1, value.getSrsId());
		}
	}

	@Override
	Node<?> addNode(NodeDefinition defn, Record r, Entity parent) {
		Long x = r.getValueAsLong(DATA.NUMBER1);
		Long y = r.getValueAsLong(DATA.NUMBER2);
		Long z = r.getValueAsLong(DATA.NUMBER3);
		String srsId = r.getValueAsString(DATA.TEXT1);
		Coordinate c = new Coordinate(x, y, z, srsId);
		return parent.addValue(defn.getName(), c);
	}

}